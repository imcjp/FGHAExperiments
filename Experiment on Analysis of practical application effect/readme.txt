main.m                      实现算法文献《Optimal Non-Uniform Deployments in Ultra-Dense Finite-Area》的相关算法实验，并将本研究所提出的快速高斯超几何函数求解算法与Matlab内置的算法作对比
pdfOf2D.m                   实现了二维空间中关于节点分布的概率密度函数
proOfBaseStation.m          求解了离位于r0处的用户距离为d1处有最近基站的概率
connProByFastAlg.m          基于本研究所提出的快速高斯超几何函数求解算法求解了用户在r0处与距离其d1处的基站建立连接的概率
regionalCoverageByFastAlg.m	基于本研究所提出的快速高斯超几何函数求解算法求解了区域覆盖率
connProByOrgAlg.m           基于Matlab内置的高斯超几何函数求解算法求解了用户在r0处与距离其d1处的基站建立连接的概率
regionalCoverageByOrgAlg.m	基于Matlab内置的高斯超几何函数求解算法求解了区域覆盖率
createfigure.m              用于画出图像
fastHypergeom.c             实现了本研究所提出的快速高斯超几何函数的源码
fastHypergeom.mexw64        根据fastHypergeom.c编译的mex文件（如果运行环境不支持该文件执行，请根据fastHypergeom.c运行"mex fastHypergeom.c"自行编译）