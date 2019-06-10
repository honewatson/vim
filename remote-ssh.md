# Editing remote files in Vim with SSH

1. ## Configure SSH

    In `~/.ssh/config`, include the lines:

    ```
    Host *
    ControlPath ~/.ssh/sockets/%r@%h-%p
    ```

1. ## Start SSH

    In a shell, start an SSH session to the server on which the file is stored:

    ```sh
    ssh -MNv username@server.example.org &
    ```

    > 💡
    **_Note:_** If SSH isn't configured to connect to the server without prompting for a password, omit
    the `&` symbol from the end of the command above.  Also, the command shown in the next step will
    need to be run in another shell.

1. ## Start Vim

    There are two options for specifying the path to the file to be edited:

    > 💡
    **_Note:_** If the username on the local computer is the same as the username on the remote server, 
    the `username@` portion of the SCP URLs shown below may omitted.  If unsure, it's best to include the
    username as shown.


    1. ### Using a path relative to the user's home directory

        After SSH has connected, start Vim with an SCP URL for the file to be edited:

        ```sh
        vim scp://username@server.example.org/path/to/personal/file.txt
        ```

        Now, any file operations in Vim will be sent over the network by SSH.

        The path to the file given in the example above is relative to the home directory of the username.  If the
        home directory is `/home/username`, then the file being edited in the example would be 
        `/home/username/path/to/personal/file.txt`.

    1. ### Using a path absolute to the server's root filesystem

        To use an absolute path, one that begins at the root filesystem of `server.example.org`, two slashes
        must be used between the hostname and the file path ("`//`").  An absolute path example equivalent to 
        the one above, assuming the home directory is `/home/username`, would be:

        ```sh
        vim scp://username@server.example.org//home/username/path/to/personal/file.txt
        ```

        Another example of an absolute path, using a commonly-available file, `/etc/shells`:

        ```sh
        vim scp://username@server.example.org//etc/shells
        ```
