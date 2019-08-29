main.m                      Realize the related algorithm experiment of paper "Optimal Non-Uniform Deployments in Ultra-Dense Finite-Area", and compare the algorithm proposed in this paper with the built-in algorithm of MATLAB.
pdfOf2D.m                   To realize the probability density function of node distribution in two-dimensional space.
proOfBaseStation.m          To solve the probability of having the nearest base station at D1 from R0.
connProByFastAlg.m          Based on FGHA in this paper, solving the probability of establishing a connection between user and base station at r0 and d1.
regionalCoverageByFastAlg.m	Based on FGHA in this paper, solving the region coverage.
connProByOrgAlg.m           Based on the built-in algorithm of solving Gauss hypergeometric function in MATLAB, solving the probability of establishing a connection between user and base station at r0 and d1.
regionalCoverageByOrgAlg.m	Based on the built-in algorithm of solving Gauss hypergeometric function in MATLAB, solving the region coverage.
createfigure.m              Used to draw images
fastHypergeom.c             The source code of FGHA(Fast Gauss Hypergeometric function solving Algorithm) proposed in this paper is implemented.
fastHypergeom.mexw64        Mex files compiled according to fastHypergeom.c. (If the running environment does not support this file execution, run "mex fastHypergeom.c" to compile according to fastHypergeom.c)