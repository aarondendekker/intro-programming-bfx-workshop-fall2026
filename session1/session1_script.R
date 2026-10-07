# ==============================================================
# Session 1: Foundations
# R for Cancer Research Data Analysis
# ==============================================================
#
# HOW TO USE THIS FILE
#   - This is your working file for today. Type in it, save it,
#     and keep it: it becomes your own notes.
#   - "Type along" spots are EMPTY ON PURPOSE. Your instructor will
#     write code live on the screen. Type the same thing (or your
#     own variation) in the blank space below the prompt.
#   - "Exercise" spots already have code, with blanks (___) for you
#     to fill in. A line with a blank shows an error until you fill
#     it in, and that is expected.
#   - Run the line your cursor is on:   Ctrl+Enter   (Mac: Cmd+Enter)
#   - Run several lines: select them, then press Ctrl+Enter.
#   - Lines that start with # are comments: notes for humans that R
#     ignores. Add your own!
#   - Click the outline icon at the top right of this pane to jump
#     between sections.


# 0. Setup check ----------------------------------------------

# Run each line. If anything errors, tell us now.
R.version.string
getwd()
library(tidyverse)
packageVersion("tidyverse")


# 1. Console, objects, and functions --------------------------

# KEY IDEAS
#   - The console is where R runs commands. A script is where you
#     save the commands you want to keep.
#   - An object is a value with a name:  x <- 5
#     (shortcut for <- is Alt+-, Mac: Option+-)
#   - A function does something to its inputs (called arguments):
#     round(3.14159, digits = 2)
#   - R is case-sensitive: age, Age, and AGE are three different names.

# Type along: arithmetic



# Type along: give a value a name with <-



# Type along: call a function with arguments, then open its help page with ?round



# Type along: where are we, and what files can we see?



# 2. Data types and vectors -----------------------------------

# KEY IDEAS
#   - Every value has a type: numeric (3.14), character ("TP53"),
#     logical (TRUE or FALSE). Whole numbers can be integer (3L).
#   - A vector is an ordered collection of values that are all the
#     SAME type. Almost everything in R is built from vectors.

# Type along: typeof() and class() on a number, some text, and TRUE



# Type along: a vector of gene names and a vector of expression values



# Type along: vector arithmetic, and picking elements out by
# position, by condition, and by name



# Type along: what does NA do?



# Exercise 1.1: Predict, then run
# Write your prediction in the comment on each line, then run it.
class(c(1L, 2.5))     # my prediction:
TRUE + 1              # my prediction:
as.integer("7")       # my prediction:
as.numeric("seven")   # my prediction:
c(TRUE, "a")          # my prediction:
10 %/% 3              # my prediction:


# Exercise 1.2: Expression values and missing data
expr <- c(TP53 = 120, KRAS = 340, MYC = NA, EGFR = 88, PTEN = 15)

# a) Which genes have expression above 100? Try the obvious way first.
expr[expr > ___]

# b) Look closely at the result. What happened with MYC?
#    Fix it so only genes that are definitely above 100 are returned.
expr[___]

# c) How many genes have a missing value?
sum(___)

# d) mean(expr) returns NA. Get the mean of the non-missing values.
mean(expr, ___ = TRUE)


# 3. Factors --------------------------------------------------

# KEY IDEAS
#   - A factor is R's type for categories. It stores integer codes
#     plus labels (called levels).
#   - Levels default to alphabetical order. The FIRST level is the
#     reference that many statistical models compare against.

# Type along: make a factor from text, then look at levels() and table()



# Exercise 1.3: Setting the reference level
arm <- c("drugA", "placebo", "drugB", "placebo", "drugA", "placebo")
arm_f <- factor(arm)

# a) What is the first level? Why?
levels(arm_f)

# b) Rebuild the factor so "placebo" is the reference (first) level.
arm_f <- factor(arm, levels = c("___", "drugA", "drugB"))
levels(arm_f)

# c) How many samples are in each arm?
table(___)

# d) Factors are stored as integers underneath. Confirm it:
as.integer(arm_f)


# 4. Lists and data frames ------------------------------------

# KEY IDEAS
#   - A list can hold different types and different lengths.
#   - A data frame is a list of equal-length vectors, drawn as a
#     table: one column per variable, one row per observation.

# Type along: a list describing one patient (id, age, a vector of markers).
# Compare patient$id, patient[["id"]], and patient["id"].



# Type along: a small data frame, then str(), names(), dim(), $, and [row, column]



# Exercise 1.4: A small cohort
cohort <- data.frame(
  patient_id = c("PT-001", "PT-002", "PT-003", "PT-004"),
  age        = c(58, 71, 64, 49),
  stage      = c("IV", "IIA", "III", "IV"),
  kras       = c("mutant", "wild-type", "mutant", "mutant")
)

# a) Rows for stage IV patients only
cohort[cohort$stage == "___", ]

# b) The age column as a plain vector, two different ways
cohort$___
cohort[["___"]]

# c) Mean age of the KRAS-mutant patients
mean(cohort$age[cohort$kras == "___"])

# d) A data frame is a list. Check it, then explain (in a comment)
#    why length() gives the number it does.
is.list(cohort)
length(cohort)


# 5. Wrap-up --------------------------------------------------

# Common gotchas so far:
#   - <- assigns, == compares. (= assigns in some places; avoid it.)
#   - R counts from 1, not 0.
#   - NA is contagious: most calculations that touch an NA return NA
#     unless you say na.rm = TRUE.
#   - A vector holds ONE type. Mixing types silently converts everything
#     (usually to text).
#   - Factor levels default to alphabetical order, which may not be
#     the reference you want.
#   - [ ] gives back the same kind of thing you started with;
#     [[ ]] and $ pull one element out.

# Muddiest point from today (one sentence):


# Homework 1 is handed out separately.
