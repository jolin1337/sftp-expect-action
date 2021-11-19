# Expect SFTP Github Action

Github Action to send commands via SFTP with password


## Usage

```
- name: Run expect commands
  uses: jolin1337/sftp-expect-action
  with:
    host: ${{ secrets.SERVER_HOST }}
    user: ${{ secrets.SERVER_USER }}
    pass: ${{ secrets.SERVER_PASS }}
    run: |
      # your 
      # commands
      # here
```

Optional ssh port

```
- name: Run expect commands
  uses: matheusvanzan/sshpass-action@v2
  uses: jolin1337/sftp-expect-action
  with:
    host: ${{ secrets.SERVER_HOST }}
    port: 22
    user: ${{ secrets.SERVER_USER }}
    pass: ${{ secrets.SERVER_PASS }}
    run: |
      # your 
      # commands
      # here
```
