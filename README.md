# Spearman
# Language: R
# Input: CSV (abundances)
# Output: CSV (correlations)

PluMA plugin to compute Spearman correlations (Spearman, 1904).  The plugin
accepts input in the form of a CSV file with rows representing samples and columns
representing community members, and entry (i, j) holding the abundance of member j
in sample i.

The plugin produces an output CSV of correlations, with rows and columns
representing members and entry (i, j) storing the Spearman correlation between
member i and member j.
