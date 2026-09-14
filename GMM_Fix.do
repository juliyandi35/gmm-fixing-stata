import excel "C:\Users\JULI YANDI RAHMAN\Downloads\Kerjaan\GMM Fixing\Dataset.xlsx", sheet("Sheet1") firstrow
xtset CrossID Date
gen sqrtWOBD = sqrt(WOBD+0.5)
gen sqrtSRD = sqrt(SRD+0.5)
gen sqrtROA = sqrt(ROA+0.5)
gen sqrtREP = sqrt(REP+0.5)
gen sqrtGROWTH = sqrt(GROWTH+0.75)
gen sqrtFS = sqrt(FS+0.5)
gen sqrtFA = sqrt(FA+0.5)
gen sqrtDER = sqrt(DER+0.5)
gen sqrtDA = sqrt(DA+0.5)
gen sqrtBS = sqrt(BS+0.5)

xtabond sqrtROA sqrtBS sqrtDA sqrtDER sqrtFA sqrtFS sqrtGROWTH sqrtREP sqrtSRD sqrtWOBD, lags(1) artests(2)
estat sargan
xtabond sqrtROA sqrtBS sqrtDA sqrtDER sqrtFA sqrtFS sqrtGROWTH sqrtREP sqrtSRD sqrtWOBD, lags(1) vce(robust) artests(2)
estat sargan
xtdpdsys sqrtROA sqrtBS sqrtDA sqrtDER sqrtFA sqrtFS sqrtGROWTH sqrtREP sqrtSRD sqrtWOBD, lags(1) artests(2)
estat sargan
xtdpdsys sqrtROA sqrtBS sqrtDA sqrtDER sqrtFA sqrtFS sqrtGROWTH sqrtREP sqrtSRD sqrtWOBD, lags(1) vce(robust) artests(2)
estat sargan
estat abond
regress sqrtROA sqrtBS sqrtDA sqrtDER sqrtFA sqrtFS sqrtGROWTH sqrtREP sqrtSRD sqrtWOBD
estat hettest