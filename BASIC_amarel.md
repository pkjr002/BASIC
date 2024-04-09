# Specify SSH details on local
In the ```~/.ssh/config``` file (if it doesnot exist, create it) add the following
```
Host amarel.rutgers
  HostName amarel.rutgers.edu
  User unme001
```

## Transfer files from your local system to your Amarel /home directory
```
scp file_1.txt file_2.txt unme001@amarel.rutgers.edu:/home/unme001
```

## Downloadfile from Amarel /home to your local
```
scp unme001@amarel.rutgers.edu:/home/unme001/file_1.txt .
```

## Copy full directory scp: Package directory as a single, compressed file before moving it
```
tar -czf my_dir.tar.gz my_dir
```