main.m                      实现算法文献《Optimal Non-Uniform Deployments in Ultra-Dense Finite-Area》的相关算法实验，并将本研究所提出的快速高斯超几何函数求解算法与Matlab内置的算法作对比
fastHypergeom.c             实现了本研究所提出的快速高斯超几何函数的源码
fastHypergeom.mexw64        根据fastHypergeom.c编译的mex文件（如果运行环境不支持该文件执行，请根据fastHypergeom.c运行"mex fastHypergeom.c"自行编译）