// @flow
import "babel-polyfill"

import { spawnSync } from "child_process"
import { basename, dirname, extname, join } from "path"
import { writeFile } from "fs"

import request from "request-promise"
// request.debug = true

async function authenticate(email: string, password: string): Promise<string> {
  try {
    const response = await request({
      method: "POST",
      uri: "https://api.artsy.net/oauth2/access_token",
      qs: {
        // Eigen OSS keys https://github.com/artsy/eigen/blob/master/Makefile
        client_id: "e750db60ac506978fc70",
        client_secret: "3a33d2085cbd1176153f99781bbce7c6",
        grant_type: "credentials",
        email,
        password
      },
      headers: {
        "content-type": "application/json"
      },
      json: true
    })
    return response.access_token
  }
  catch (error) {
    console.error(error)
    process.exit(1)
  }
}

async function get(token: string, fixturePath: string) {
  const url = `https://api.artsy.net/${dirname(fixturePath)}/${basename(fixturePath, ".json")}`
  console.log(url)
  try {
    const response = await request({
      method: "GET",
      uri: url,
      headers: {
        "x-access-token": token,
        "content-type": "application/json"
      },
      json: true
    })
    return response
  }
  catch (error) {
    console.error(error)
    process.exit(1)
  }
}

function fixturePaths(all: boolean): Array<string> {
  const args = ["ls-files", "--others", "--exclude-standard"]
  if (all) {
    args.push("--cached")
  }

  const command = spawnSync("git", args, { cwd: "gravity", encoding: "utf-8" })
  const error = command.error
  const stdout: string = (command.stdout: any) // Oh yeah, upcast then downcast. Live life dangerously.

  if (error) {
    console.error(error)
    process.exit(1)
  } else {
    const paths = []
    stdout.split(/\n/).forEach(file => {
      if (extname(file) === ".json") {
        paths.push(file)
      }
    })
    return paths
  }
}

async function main(argv) {
  const email = argv[2]
  const password = argv[3]
  const rebuild = argv[4] === "--rebuild"

  if (!email || !password) {
    console.log("Usage: gravity.js EMAIL PASSWORD [--rebuild]")
    process.exit(1)
  }

  const paths = fixturePaths(rebuild)
  if (paths.length > 0) {
    const token = await authenticate(email, password)

    for (const fixturePath of paths) {
      const payload = await get(token, fixturePath)
      writeFile(join("gravity", fixturePath), JSON.stringify(payload, null, 2), error => {
        console.error(error)
      })
    }
  }
}

main(process.argv)
