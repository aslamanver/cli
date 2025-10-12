## CLI

- Compress current directory: `tar -czf file.tar.gz ./*`
- View contents of a tar.gz file: `tar -tzf file.tar.gz`
- Extract a tar.gz file: `tar -xzf file.tar.gz`

### enc.sh

`enc.sh` is a simple shell script that provides encryption and decryption functionalities using OpenSSL. It allows you to securely encrypt and decrypt files using a password.

```sh
bash  <(curl  -s https://aslamanver.github.io/cli/enc)
```

### cmdx.sh

`cmdx` is a simple command-line utility to create, manage, and execute custom command shortcuts right from your terminal.

Example usage: `cmdx <your-command-name> "<your-long-command>"`

```sh
cmdx add happy-follower "curl -s https://api.github.com/users/aslamanver/followers | jq -r '.[0].avatar_url'"
cmdx happy-follower

cmdx remove happy-follower
cmdx list
```

That's it! You now have a simple way to manage and execute your custom command shortcuts using `cmdx happy-follower`.
