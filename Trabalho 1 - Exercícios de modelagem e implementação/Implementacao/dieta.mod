#conjuntos base
set ALIMENTOS;
set NUTRIENTES;

#parâmetros dos alimentos
param custo {ALIMENTOS} >= 0;
param q_min {ALIMENTOS} >= 0;
param q_max {ALIMENTOS} >= 0;

#parâmetros dos nutrientes
param m_min {NUTRIENTES} >= 0;
param M_max {NUTRIENTES} >= 0;

#matriz de quantidade do nutriente j no alimento i
param a {NUTRIENTES, ALIMENTOS} >= 0;

#variáveis de decisão (quantidade de porções, limitadas por q_i e Q_i)
var x {i in ALIMENTOS} >= q_min[i], <= q_max[i];

#função objetivo: minimizar o custo total 
minimize Custo_Total:
    sum {i in ALIMENTOS} custo[i] * x[i];

#restrições
subject to Restricao_Nutricional {j in NUTRIENTES}:
    m_min[j] <= sum {i in ALIMENTOS} a[j,i] * x[i] <= M_max[j];