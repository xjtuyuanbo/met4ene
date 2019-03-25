#!/bin/tcsh
# This script downloads and installs all the required wrf libraries into the specified diretory

echo "Installing packages required by WRF..."

setenv DIR /home/ec2-user/environment/Build_WRF/LIBRARIES
setenv CC gcc
setenv CXX g++
setenv FC gfortran
setenv FCFLAGS -m64
setenv F77 gfortran
setenv FFLAGS -m64

# Check to see if the LIBRARIES dir exists
if ( ! -d $DIR ) then
   mkdir -p $DIR
endif

cd $DIR

# Install NetCDF
wget "http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/netcdf-4.1.3.tar.gz"
tar xzvf netcdf-4.1.3.tar.gz
cd netcdf-4.1.3
./configure --prefix=$DIR/netcdf --disable-dap --disable-netcdf-4 --disable-shared
make
make install
setenv PATH $DIR/netcdf/bin:$PATH
setenv NETCDF $DIR/netcdf
cd ..

# Install mpich
sudo yum install mpich2

# Install zlib
sudo yum install zlib 

# Install libpng
sudo yum install libpng

# Install jasperlib
sudo yum install jasper