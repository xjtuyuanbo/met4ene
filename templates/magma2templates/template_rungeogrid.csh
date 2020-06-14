#!/bin/csh

#SBATCH -J geogrid		# Job name
#SBATCH -o /share/mzhang/by276/wrf_data/met4ene/wrfout/logs/output.geogrid.%j	# Name of stdout output file (%j expands to jobId)
#SBATCH -e /share/mzhang/by276/wrf_data/met4ene/wrfout/logs/errors.geogrid.%j	# Name of stderr output file (%j expands to jobId)
#SBATCH --nodes=1		# Total number of nodes requested 
#SBATCH --ntasks=1		# Total number of tasks to be configured for. 
#SBATCH --tasks-per-node=1	# sets number of tasks to run on each node. 
#SBATCH --cpus-per-task=1	# sets number of cpus needed by each task (if task is "make -j3" number should be 3).
#SBATCH --get-user-env		# tells sbatch to retrieve the users login environment. 
#SBATCH -t 00:10:00		# Run time (hh:mm:ss) 
#SBATCH --mem=1000M		# memory required per node
#SBATCH --partition=default_cpu	# Which queue it should run on. 

if ( $#argv == 1 ) then
    cd $argv
    set wrfoutdir = $argv
else
    echo " rungeogrid.csh takes at most one input. "
    set wrfoutdir = "./"
endif

limit stacksize unlimited

${wrfoutdir}geogrid.exe

exit
