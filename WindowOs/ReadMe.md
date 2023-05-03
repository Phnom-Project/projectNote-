### window update manual
```
sfc /scannow
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth
```
### wifi (missing adapter)
```shell
netsh int ip reset C:\resetlog.txt
netsh winsock reset
netcfg -d
```
