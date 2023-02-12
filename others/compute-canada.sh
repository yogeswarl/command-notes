## compute canada uses slurm to queue from their login to compute nodes.

## use sbatch to submit a job.
##use salloc to request cpu time for interative jobs.


#SBATCH --time=8:00:00
#SBATCH --account=account-name
#SBATCH --nodes=1
#SBATCH --tasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem-per-cpu=8G
#SBATCH --mail-user=correspondence@tosend.com
#SBATCH --mail-type=ALL

## loading a module 
module load StdEnv/2020 gcc/9.3.0 cuda/11.0

sq #get quick summary of pending or running jobs on runtime and cpus asked for
scontrol show job -dd <jobid> #shows detailed job details

sacct -j <jobid> #show detailed job details from completed jobs.
scancel <jobid> #cancel a job




#for multiprocessing, you need to use spawn method, Linux uses fork that cannot inherit values from its parent process.