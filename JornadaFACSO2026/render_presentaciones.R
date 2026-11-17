# Ejecutar desde esta carpeta: source("render_presentaciones.R")
if (!rmarkdown::pandoc_available()) {
  candidatos <- c("/Applications/quarto/bin/tools", "/Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools")
  for (directorio in candidatos) {
    if (file.exists(file.path(directorio, "pandoc"))) {
      Sys.setenv(RSTUDIO_PANDOC = directorio)
      rmarkdown::find_pandoc(cache = FALSE)
      break
    }
  }
}
if (!rmarkdown::pandoc_available()) stop("No se encontró Pandoc. Instala Quarto o configura RSTUDIO_PANDOC.")
for (archivo in list.files(pattern = "[.]Rmd$")) {
  message("Renderizando: ", archivo)
  rmarkdown::render(archivo, envir = new.env(), quiet = TRUE)
}
