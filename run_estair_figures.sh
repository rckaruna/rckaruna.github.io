#!/bin/bash
# Run from ~/research/airsensor-gstudy/ after copying 11_estair_figures.R into R/.
set -e
Rscript R/11_estair_figures.R
for f in fig1_dstudy fig2_regimes fig3_error_budget; do
  pdfinfo output/figures/$f.pdf | grep -E "Pages|Page size"
  pdftoppm -png -r 150 -singlefile output/figures/$f.pdf output/figures/${f}_check
done
echo "Previews: output/figures/fig{1_dstudy,2_regimes,3_error_budget}_check.png — open and check labels."
# Rebuild the code archive for the SI (scripts 01-11).
(cd R && zip -q ../output/airsensor_gstudy_code.zip 01_load_validate.R 02_variance_decomposition.R \
  03_reference_facet.R 04_figures_airsensor.R 05_robustness.R 06_toc_graphic.R 07_estl_figures.R \
  08_si_extras.R 09_verify_manuscript_numbers.R 10_si_figures_final.R 11_estair_figures.R)
echo "Wrote output/airsensor_gstudy_code.zip"
