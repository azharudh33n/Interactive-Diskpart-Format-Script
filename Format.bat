@echo off

:start
cls
echo Available Disks:
diskpart /s list disk
echo.
set /p disk=Enter the disk number: 
if not defined disk goto start
echo.

echo Cleaning disk %disk%...
diskpart /s <<EOF
select disk %disk%
clean
EOF
echo.

echo Creating partition on disk %disk%...
diskpart /s <<EOF
select disk %disk%
create partition primary
select partition 1
EOF
echo.

echo Formatting disk %disk%...
diskpart /s <<EOF
select disk %disk%
select partition 1
format fs=ntfs quick
EOF
echo.

echo Assigning disk %disk%...
diskpart /s <<EOF
select disk %disk%
select partition 1
assign
EOF
echo.

echo Completed!
pause