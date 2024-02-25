library(ymlthis)
library(fs)

# Creando Directorio Principal
project_path <- path(getwd(), "Bioestadistica-Course-UC")
course_dir <- dir_create(project_path)

# Crea el Proyecto
usethis::create_project(project_path, rstudio = FALSE)

# Especificadno directorio principal.
# Primero guarda este archivo como make_script.R
# Este comando coloca el wd en la carpeta perent del poryecto y dificulta el manejo de archivos
# here::i_am(path("Bioestadística-Course-UC", "make_script", ext = "R"))

# Finaliza la creación de otros directorios y archivos importantes
fig_dir <- dir_create(path(course_dir, "fig"))
tex_dir <- dir_create(path(course_dir, "latex"))
output_dir <- dir_create(path(course_dir, "docs"))
content_dir <- dir_create(path(course_dir, "content"))

# Aqui deberia crear un ReadMe.md
usethis::use_readme_md() # Añade contenido

# Encabezados
bioestat_yml <- yml_empty() %>% 
  yml_title("Bioestadística.") %>%
  yml_author("Marcelo J. Molinatti") %>%
  yml_date(format(Sys.Date(), "%B %d, %Y")) %>%
  yml_toc(toc=TRUE, toc_depth=2, toc_title="Índice.") %>%
  yml_latex_opts(
    fontsize = "12pt",
    geometry = c("left=3cm", "right=3cm", "top=2.5cm", "bottom=2.5cm"),
    lof = FALSE, lot = FALSE,
    linestretch = 1.5, 
    secnumdepth = 2, 
    colorlinks = TRUE, 
    natbiboptions = c("authoryear", "comma")) %>%
  yml_citations(
    bibliography = here::here("latex", "references.bib"),
    biblio_style = "apalike", 
    biblio_title = "Bibliografia",  
    link_citations = TRUE) %>%
  yml_bookdown_opts(
    book_filename = "Bioestadistitica-UC",
    rmd_files = c("index.Rmd", list.files(here::here("content"))),
    rmd_subdir = here::here("content"),
    output_dir = here::here("docs"),
  ) %>%
  yml_lang("es-ES")

# Creo archivo _bookdown.yml
# El archivo creado debo modificarlo de tal forma que el campo rmd_files
# tenga la direccion relativa completa de los archivos. Ademas, rmd_subdir no
# parece servir para nada.
bioestat_yml %>% 
  use_bookdown_yml(path = here::here())

# Add some extra fields to _bookdown
url: 'https\://bookdown.org/john/awesome/'
github-repo: "john/awesome"

# Creo archivo _output.yml
bioestat_yml %>%
  yml_output(
    bookdown::gitbook(
      split_by = "section",
  	  split_bib = TRUE
  	)
  ) %>% 
  use_output_yml(path = here::here())

# Add some extra fields to _output.yml
number_sections: true
  config:
    toc:
      before: |
        <li><a href="...">My Awesome Book</a></li>
        <li><a href="...">John Smith</a></li>
      after: |
        <li><a href="https://github.com/rstudio/bookdown">
        Proudly published with bookdown</a></li>

# Creando index.Rmd
index_file <- file_create(here::here("index.Rmd"))
cat("# Prefacio {-}", file = index_file, sep = "\n\n")

# Add before_script para cargar los paquetes necesarios. Estos 
# se deben esepcificar en el prefacio, con versión y demás.


# Renderizado
bookdown::render_book(here::here("index.Rmd"))