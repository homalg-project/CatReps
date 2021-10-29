# SPDX-License-Identifier: GPL-2.0-or-later
# CatReps: Representations and cohomology of finite categories
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "CatReps",
Subtitle := "Representations and cohomology of finite categories",
Version := "2021.10-03",

Date := "29/10/2021",
Date := "29/10/2021",
License := "GPL-2.0-or-later",

Persons := [
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Mohamed",
    LastName := "Barakat",
    WWWHome := "https://mohamed-barakat.github.io",
    Email := "mohamed.barakat@uni-siegen.de",
    PostalAddress := Concatenation(
               "Walter-Flex-Str. 3\n",
               "57068 Siegen\n",
               "Germany" ),
    Place := "Siegen",
    Institution := "University of Siegen",
  ),
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Tibor",
    LastName := "Grün",
    WWWHome := "https://github.com/Tschitschibor",
    Email := "tibor.gruen@student.uni-siegen.de",
    PostalAddress := Concatenation(
               "Walter-Flex-Str. 3\n",
               "57068 Siegen\n",
               "Germany" ),
    Place := "Siegen",
    Institution := "University of Siegen",
  ),
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Peter",
    LastName := "Webb",
    WWWHome := "https://www-users.math.umn.edu/~webb",
    Email := "webb@math.umn.edu",
    PostalAddress := Concatenation(
               "School of Mathematics,\n",
               "University of Minnesota,\n",
               "Minneapolis, MN 55455" ),
    Place := "Minneapolis",
    Institution := "University of Minnesota",
  ),
],

# BEGIN URLS
SourceRepository := rec(
    Type := "git",
    URL := "https://github.com/homalg-project/CatReps",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://homalg-project.github.io/pkg/CatReps",
PackageInfoURL  := "https://homalg-project.github.io/CatReps/PackageInfo.g",
README_URL      := "https://homalg-project.github.io/CatReps/README.md",
ArchiveURL      := Concatenation( "https://github.com/homalg-project/CatReps/releases/download/v", ~.Version, "/CatReps-", ~.Version ),
# END URLS

ArchiveFormats := ".tar.gz .zip",

##  Status information. Currently the following cases are recognized:
##    "accepted"      for successfully refereed packages
##    "submitted"     for packages submitted for the refereeing
##    "deposited"     for packages for which the GAP developers agreed
##                    to distribute them with the core GAP system
##    "dev"           for development versions of packages
##    "other"         for all other packages
##
Status := "dev",

AbstractHTML   :=  "",

PackageDoc := rec(
  BookName  := "CatReps",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Representations and cohomology of finite categories",
),

Dependencies := rec(
  GAP := ">= 4.9.1",
  NeededOtherPackages := [
                   [ "GAPDoc", ">= 1.5" ],
                   [ "CAP", ">= 2021.10-06" ],
                   [ "MonoidalCategories", ">= 2021.08-01" ],
                   [ "LinearAlgebraForCAP", ">= 2021.07-01" ],
                   [ "FinSetsForCAP", ">= 2020.04.01" ],
                   [ "CategoryConstructor", ">= 2021.10-07" ],
                   [ "SubcategoriesForCAP", ">= 2020.06-01" ],
                   [ "MatricesForHomalg", ">= 2020.02.02" ],
                   [ "Toposes", ">= 2020.04.27" ],
                   [ "Algebroids", ">= 2021.08-02" ],
                   [ "FunctorCategories", ">= 2021.08-01" ],
                   ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ],
),

AvailabilityTest := function()
        return true;
    end,

TestFile := "tst/testall.g",

Keywords := [ "finite categories, concrete categories, representations of categories" ],

));
