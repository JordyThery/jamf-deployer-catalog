# The PreStage groups match PreStage names by regular expression, so the
# tenant's name prefix is escaped before it becomes part of the pattern.
locals {
  prestage_pattern = "${replace(var.name_prefix, "/[.^$|()\\[\\]{}*+?\\\\]/", "\\$0")}PreStage - "
}
