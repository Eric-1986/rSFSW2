#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* .C calls: manually added because Rcpp v0.12.12 registers them as .Call instead of .C */
extern void C_dailyWeather2_R(int* nSites, double latitudes[], double longitudes[],
  int* year, int* month, int* type, int* printdebug);
extern void C_dailyWeather2Write_R(int* nSites, char* siteNames[], char* siteDirs[],
  int* year);
extern void C_monthlyClimate2_R(int* nSites, double latitudes[], double longitudes[],
  char* siteDirs[], int* yearLow, int* yearHigh, int* type, int* printdebug);
extern void C_writeMonthlyClimate2_R(char **siteDir);

static R_NativePrimitiveArgType C_dailyWeather2_R_t[7] = {INTSXP, REALSXP, REALSXP, INTSXP,
  INTSXP, INTSXP, INTSXP};
static R_NativePrimitiveArgType C_dailyWeather2Write_R_t[4] = {INTSXP, STRSXP, STRSXP,
  INTSXP};
static R_NativePrimitiveArgType C_monthlyClimate2_R_t[8] = {INTSXP, REALSXP, REALSXP,
  STRSXP, INTSXP, INTSXP, INTSXP, INTSXP};
static R_NativePrimitiveArgType C_writeMonthlyClimate2_R_t[1] = {STRSXP};

static const R_CMethodDef CEntries[] = {
    {"C_dailyWeather2_R",        (DL_FUNC) &C_dailyWeather2_R,        7, C_dailyWeather2_R_t},
    {"C_dailyWeather2Write_R",   (DL_FUNC) &C_dailyWeather2Write_R,   4, C_dailyWeather2Write_R_t},
    {"C_monthlyClimate2_R",      (DL_FUNC) &C_monthlyClimate2_R,      8, C_monthlyClimate2_R_t},
    {"C_writeMonthlyClimate2_R", (DL_FUNC) &C_writeMonthlyClimate2_R, 1, C_writeMonthlyClimate2_R_t},
    {NULL, NULL, 0, NULL}
};

/* .Call calls: Rcpp v0.12.12 registers these correctly */
extern SEXP _rSFSW2_germination_wait_times(SEXP, SEXP);
extern SEXP _rSFSW2_get_KilledBySoilLayers(SEXP, SEXP);
extern SEXP _rSFSW2_setFALSE_SeedlingSurvival_1stSeason(SEXP, SEXP, SEXP, SEXP, SEXP);

static const R_CallMethodDef CallEntries[] = {
    {"_rSFSW2_germination_wait_times", (DL_FUNC) &_rSFSW2_germination_wait_times, 2},
    {"_rSFSW2_get_KilledBySoilLayers", (DL_FUNC) &_rSFSW2_get_KilledBySoilLayers, 2},
    {"_rSFSW2_setFALSE_SeedlingSurvival_1stSeason", (DL_FUNC) &_rSFSW2_setFALSE_SeedlingSurvival_1stSeason, 5},
    {NULL, NULL, 0}
};

/* Register package calls with R */
void R_init_rSFSW2(DllInfo *dll) {
    R_registerRoutines(dll, CEntries, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
    R_forceSymbols(dll, TRUE);
}
