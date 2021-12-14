## ----setup, include = FALSE---------------------------------------------------
library(IPV)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.dpi = 96
)

## ---- eval = FALSE------------------------------------------------------------
#  mydata <- HEXACO[ ,c(2:41, 122:161)] # (1.) HEXACO is a data frame containing raw data
#  res <- ipv_est(mydata, name = "HA") # (2.) produce a formatted bundle of estimates to use
#  nested_chart(res$est, file_name = "test.pdf") # (3.) create a chart with default formatting

## ---- echo = FALSE------------------------------------------------------------
HEXACO[1:3, 2:4]

## ---- eval = FALSE------------------------------------------------------------
#  # nested case: honesty/humility and agreeableness as "tests" (= sub-pools)
#  # of an overarching "construct" (= item pool)
#  res_HA <- ipv_est(dat = HEXACO[ ,c(2:41, 122:161)], name = "HA")
#  # simple case: agreeableness only
#  res_A <- ipv_est(dat = HEXACO[ ,c(122:161)], name = "A")

## ---- fig.width=10, fig.height=10, out.height="685px", out.width="685px", dev='png'----
mychart <- item_chart(data = DSSEI)
mychart

## ---- eval = FALSE------------------------------------------------------------
#  mychart <- item_chart(data = DSSEI, file_name = "DSSEI_item_chart.pdf")

## ---- eval = FALSE------------------------------------------------------------
#  item_chart(DSSEI, facet_order = c("Ab", "So", "Ph", "Pb"))

## ---- eval=FALSE, fig.width=10, fig.height=10, out.height="685px", out.width="685px", dev='png'----
#  mychart <- item_chart(
#    data = DSSEI,
#    color = "darkblue", color2 = "darkred")
#  mychart

## ---- fig.width=10, fig.height=10, out.height="685px", out.width="685px", fig.show='hold', dev='png'----
x <- DSSEI
x <- rename(x, "So", "verylongname")
mychart1 <- item_chart(data = x)
mychart2 <- item_chart(data = x, dodge = 7)
mychart1
mychart2

## ---- fig.width=10, fig.height=10, out.height="685px", out.width="685px", dev='png'----
mychart <- facet_chart(data = DSSEI)
mychart

## ---- fig.width=10, fig.height=10, out.height="685px", out.width="685px", dev='png'----
mychart <- facet_chart(data = DSSEI,
                      cor_labels = FALSE)
mychart

## ---- fig.width=10, fig.height=10, out.height="685px", out.width="685px", dev='png'----
mychart <- nested_chart(data = self_confidence)
mychart

## ---- fig.width=10, fig.height=10, out.height="685px", out.width="685px", dev='png'----
# all axes have the same scaling
nested_chart(self_confidence, relative_scaling = 1, tick = 0.2, rotate_tick_label = -.2)
# the global axis is twice as large (see dotted circles)
nested_chart(self_confidence, relative_scaling = 2, tick = 0.2, rotate_tick_label = -.2)

## ---- fig.width=10, fig.height=10, out.height="685px", out.width="685px", dev='png'----
mychart <- nested_chart(data = self_confidence,
                        subradius = .5, size_facet_labels = 2, size_cor_labels_inner = 1.5)
mychart

## ---- fig.width=10, fig.height=10, out.height="685px", out.width="685px", dev='png'----
x <- data.frame(
  test1 = rep(NA, 3), facet1 = NA,
  test2 = NA, facet2 = NA,
  value = NA)
x[1, ] <- c("DSSEI", "Ab", "RSES", "Ps", ".67") # first arrow
x[2, ] <- c("DSSEI", "Ab", "SMTQ", "Cs", ".81") # second arrow
x[3, ] <- c("SMTQ", "Ct", "RSES", "Ns", ".76") # third arrow
x

mychart <- nested_chart(
  data = self_confidence,
  subradius = .5, size_facet_labels = 2, size_cor_labels_inner = 1.5,
  xarrows = x)
mychart

## ---- fig.width=10, fig.height=10, out.height="685px", out.width="685px", dev='png'----
mychart <- nested_chart(
  data = self_confidence,
  subradius = .5, size_facet_labels = 2, size_cor_labels_inner = 1.5,
  xarrows = x,
  subrotate_degrees = c(180, 270, 90), dist_construct_label = .7,
  rotate_test_labels_degrees = c(0, 120, 0))
mychart

## ---- fig.width=10, fig.height=10, out.height="685px", out.width="685px", dev='png'----
mychart <- nested_chart(
  data = self_confidence,
  subradius = .5, size_facet_labels = 2, size_cor_labels_inner = 1.5,
  xarrows = x,
  subrotate_degrees = c(180, 270, 90), dist_construct_label = .7,
  rotate_test_labels_degrees = c(0, 120, 0),
  cor_labels_tests = FALSE)
mychart

## ---- fig.width=10, fig.height=10, out.height="685px", out.width="685px", dev='png'----
mychart <- nested_chart(
  data = self_confidence,
  subradius = .5, size_facet_labels = 2, size_cor_labels_inner = 1.5,
  xarrows = x,
  subrotate_degrees = c(180, 270, 90), dist_construct_label = .7,
  rotate_construct_label_degrees = -15,
  rotate_test_labels_degrees = c(0, 120, 0),
  size_construct_label = 1.3, size_test_labels = 1.2,
  width_circles_inner = 1.2, width_circles = 1.2, width_axes_inner = 1.2, width_axes = 1.2)
mychart

## -----------------------------------------------------------------------------
str(self_confidence, 2)
self_confidence$tests$RSES

## -----------------------------------------------------------------------------
self_confidence$global

## -----------------------------------------------------------------------------
mydata <- input_manual_simple(
test_name = "RSES",
facet_names = c("Ns", "Ps"),
items_per_facet = 5,
item_names = c(
  2, 5, 6, 8, 9,
  1, 3, 4, 7, 10),
test_loadings = c(
  .5806, .5907, .6179, .5899, .6559,
  .6005, .4932, .4476, .5033, .6431),
facet_loadings = c(
  .6484, .6011, .6988, .6426, .6914,
  .6422, .5835, .536, .5836, .6791),
correlation_matrix = matrix(
  data = c(1, .69,
           .69, 1),
  nrow = 2,
  ncol = 2))
mydata
input_manual_process(mydata)

## ---- eval = FALSE------------------------------------------------------------
#  system.file("extdata", "IPV_global.xlsx", package = "IPV", mustWork = TRUE)
#  system.file("extdata", "IPV_DSSEI.xlsx", package = "IPV", mustWork = TRUE)
#  system.file("extdata", "IPV_SMTQ.xlsx", package = "IPV", mustWork = TRUE)
#  system.file("extdata", "IPV_RSES.xlsx", package = "IPV", mustWork = TRUE)

## -----------------------------------------------------------------------------
global <- system.file("extdata", "IPV_global.xlsx", package = "IPV", mustWork = TRUE)
tests <- c(system.file("extdata", "IPV_DSSEI.xlsx", package = "IPV", mustWork = TRUE),
           system.file("extdata", "IPV_SMTQ.xlsx", package = "IPV", mustWork = TRUE),
           system.file("extdata", "IPV_RSES.xlsx", package = "IPV", mustWork = TRUE))
mydata <- input_excel(global = global, tests = tests)

## ---- eval=FALSE--------------------------------------------------------------
#  global <- system.file("extdata", "IPV_global.xlsx", package = "IPV", mustWork = TRUE)
#  tests <- c(system.file("extdata", "IPV_DSSEI.xlsx", package = "IPV", mustWork = TRUE),
#             system.file("extdata", "IPV_SMTQ.xlsx", package = "IPV", mustWork = TRUE),
#             NA)
#  mydata <- input_excel(global = global, tests = tests)

## -----------------------------------------------------------------------------
# first the global level
mydata <- input_manual_nested(
  construct_name = "Self-Confidence",
  test_names = c("DSSEI", "SMTQ", "RSES"),
  items_per_test = c(20, 14, 10),
  item_names = c(
     1,  5,  9, 13, 17, # DSSEI
     3,  7, 11, 15, 19, # DSSEI
    16,  4, 12,  8, 20, # DSSEI
     2,  6, 10, 14, 18, # DSSEI
    11, 13, 14,  1,  5,  6, # SMTQ
     3, 10, 12,  8, # SMTQ
     7,  2,  4,  9, # SMTQ
     1,  3,  4,  7, 10, # RSES
     2,  5,  6,  8,  9), # RSES
  construct_loadings = c(
    .5189, .6055, .618 , .4074, .4442,
    .5203, .2479, .529 , .554 , .5144,
    .3958, .5671, .5559, .4591, .4927,
    .3713, .5941, .4903, .5998, .6616,
    .4182, .2504, .4094, .3977, .5177, .4603,
    .3271, .261 , .3614, .4226,
    .2076, .3375, .5509, .3495,
    .5482, .4627, .4185, .4185, .5319,
    .4548, .4773, .4604, .4657, .4986),
  test_loadings = c(
    .5694, .6794, .6615, .4142, .4584, # DSSEI
    .5554, .2165, .5675, .5649, .4752, # DSSEI
    .443 , .6517, .6421, .545 , .5266, # DSSEI
    .302 , .6067, .5178, .5878, .6572, # DSSEI
    .4486, .3282, .4738, .4567, .5986, .5416, # SMTQ
    .3602, .2955, .3648, .4814, # SMTQ
    .2593, .4053, .61  , .4121, # SMTQ
    .6005, .4932, .4476, .5033, .6431, # RSES
    .5806, .5907, .6179, .5899, .6559), # RSES
  correlation_matrix = matrix(
    data = c(
      1 , .73, .62,
      .73, 1, .75,
      .62, .75, 1),
    nrow = 3,
    ncol = 3))

# then add tests individually
# test 1
mydata$tests$RSES <- input_manual_simple(
  test_name = "RSES",
  facet_names = c("Ns", "Ps"),
  items_per_facet = c(5, 5),
  item_names = c(
    2, 5, 6, 8,  9,
    1, 3, 4, 7, 10),
  test_loadings = c(
    .5806, .5907, .6179, .5899, .6559,
    .6005, .4932, .4476, .5033, .6431),
  facet_loadings = c(
    .6484, .6011, .6988, .6426, .6914,
    .6422, .5835, .536, .5836, .6791),
  correlation_matrix = matrix(
    data = c(
      1, .69,
      .69, 1),
    nrow = 2,
    ncol = 2))
# test 2
mydata$tests$DSSEI <- input_manual_simple(
  test_name = "DSSEI",
  facet_names = c("Ab", "Pb", "Ph", "So"),
  items_per_facet = 5,
  item_names = c(
    2, 6, 10, 14, 18,
    16, 4, 12, 8, 20,
    3, 7, 11, 15, 19,
    1, 5, 9, 13, 17),
  test_loadings = c(
    .302 , .6067, .5178, .5878, .6572,
    .443 , .6517, .6421, .545 , .5266,
    .5554, .2165, .5675, .5649, .4752,
    .5694, .6794, .6615, .4142, .4584),
  facet_loadings = c(
    .3347, .6537, .6078, .684 , .735 ,
    .6861, .8746, .7982, .7521, .6794,
    .7947, .3737, .819 , .7099, .5785,
    .7293, .8284, .7892, .3101, .4384),
  correlation_matrix = matrix(
    data = c(
      1, .49, .66, .76,
      .49, 1, .37, .54,
      .66, .37, 1, .53,
      .76, .54, .53, 1),
    nrow = 4,
    ncol = 4))
# test 3
mydata$tests$SMTQ <- input_manual_simple(
  test_name = "SMTQ",
  facet_names = c("Cf", "Cs", "Ct"),
  items_per_facet = c(6, 4, 4),
  item_names = c(
    11, 13, 14, 1, 5, 6,
    3, 10, 12, 8,
    7, 2, 4, 9),
  test_loadings = c(
    .4486, .3282, .4738, .4567, .5986, .5416,
    .3602, .2955, .3648, .4814,
    .2593, .4053, .61  , .4121),
  facet_loadings = c(
    .4995, .3843, .5399, .4562, .6174, .6265,
    .4601, .3766, .4744, .5255,
    .3546, .5038, .7429, .4342),
  correlation_matrix = matrix(
    data = c(
      1, .71, .62,
      .71, 1, .59,
      .62, .59,	1),
    nrow = 3,
    ncol = 3))

# finally process (as in a simple case)
my_processed_data <- input_manual_process(mydata)
my_processed_data

