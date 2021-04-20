# Docker Snippets

## Clear logs docker

### FIND the log file location

```
    docker inspect --format='{{.LogPath}}' <container id/name>
```

### Truncate file

```
    truncate -s 0 /path/to/logfile
```
