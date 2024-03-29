#! @BeginChunk RepresentingC4C4

LoadPackage( "CatReps" );

#! In order to understand the choices in the above example,
#! we made a similar example to compare the results.

#! @Example
c4c4 := ConcreteCategoryForCAP( [ [2,3,4,1], [5,6,7,8], [,,,,6,7,8,5] ] );
#! A finite concrete category
AsFpCategory( c4c4 );
#! FreeCategory( RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) / relations
UnderlyingQuiverAlgebra( AsFpCategory( c4c4 ) );
#! (Q * q) / [ 1*(a*a*a*a) - 1*(1), 1*(c*c*c*c) - 1*(2), 1*(b*c) - 1*(a*b) ]
GF3 := HomalgRingOfIntegers( 3 );
#! GF(3)
A := GF3[c4c4];
#! Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations
SetIsLinearClosureOfACategory( A, true );
#! @EndExample

#! In order to find representations of our concrete category
#! $C4C4$ we need to find matrices $a, b, c$ that
#! satisfy the relations of the algebroid.
#! Here we choose permutation matrices corresponding to the two permutations
#! $a, c$.
#! We view the permutations on $4$ points in 
#! $\mathrm{S}_4$ as elements of $\mathrm{Stab}_{\mathrm{S}_6}(5,6)$ or of 
#! $\mathrm{Stab}_{\mathrm{S}_5}(5)$. As permutation matrices, they
#! are block diagonal matrices with the smaller permutation
#! matrix on $4$ elements complemented with a $2 \times 2$ or $1 \times 1$
#! identity matrix on the diagonal.
#! This gives us two different
#! dimensions for our target matrix category, $6$ and $5$
#! respectively, and makes the choice of the matrix for b
#! less trivial.

#! @Example
CatReps := FunctorCategory( A, GF3 );
#! FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) )
amat := HomalgMatrix( One( GF3 ) *
[ [ 0,0,0,1,0,0 ], 
  [ 1,0,0,0,0,0 ], 
  [ 0,1,0,0,0,0 ], 
  [ 0,0,1,0,0,0 ], 
  [ 0,0,0,0,1,0 ], 
  [ 0,0,0,0,0,1 ] ], 6, 6, GF3 );
#! <A 6 x 6 matrix over an internal ring>
cmat := HomalgMatrix( One(GF3) *
[ [ 0,0,0,1,0 ], 
  [ 1,0,0,0,0 ], 
  [ 0,1,0,0,0 ], 
  [ 0,0,1,0,0 ], 
  [ 0,0,0,0,1 ] ], 5, 5, GF3 );
#! <A 5 x 5 matrix over an internal ring>
Display( amat^4 );
#!  1 . . . . .
#!  . 1 . . . .
#!  . . 1 . . .
#!  . . . 1 . .
#!  . . . . 1 .
#!  . . . . . 1
Display( cmat^4 );
#!  1 . . . .
#!  . 1 . . .
#!  . . 1 . .
#!  . . . 1 .
#!  . . . . 1
#! @EndExample

#! Given the matrices $a$ and $c$ above one can now solve the homogenous linear system
#! $a*b = b*c$ in the $30$ unknowns $b_{11},...,b_{65}$.
#! The following $9$ variables are free variables:

#! @Example
b11 := 0;; b12 := 1;; b13 := 0;; b21 := 1;;
b15 := 0;; b51 := 1;; b55 := 0;; b61 := 1;; b65 := 1;;
bmat := HomalgMatrix( One( GF3 ) *
[ [b11,b12,b13,b21,b15], 
  [b21,b11,b12,b13,b15], 
  [b13,b21,b11,b12,b15], 
  [b12,b13,b21,b11,b15], 
  [b51,b51,b51,b51,b55], 
  [b61,b61,b61,b61,b65] ], 6, 5, GF3 );
#! <A 6 x 5 matrix over an internal ring>
Display( bmat );
#!  . 1 . 1 .
#!  1 . 1 . .
#!  . 1 . 1 .
#!  1 . 1 . .
#!  1 1 1 1 .
#!  1 1 1 1 1
Display( amat * bmat );
#!  1 . 1 . .
#!  . 1 . 1 .
#!  1 . 1 . .
#!  . 1 . 1 .
#!  1 1 1 1 .
#!  1 1 1 1 1
Display( bmat * cmat );
#!  1 . 1 . .
#!  . 1 . 1 .
#!  1 . 1 . .
#!  . 1 . 1 .
#!  1 1 1 1 .
#!  1 1 1 1 1
amat * bmat = bmat * cmat;
#! true
#! @EndExample

#! So the three relations in our algebroid should be satisfied
#! by these matrices, therefore they should provide a
#! well-defined representation of C4C4.

#! @Example
eleven := AsObjectInFunctorCategory( CatReps, [ 6, 5 ], [ amat, bmat, cmat ] );
#! <(1)->6, (2)->5; (a)->6x6, (b)->6x5, (c)->5x5>
IsWellDefined( eleven );
#! true
Display( eleven );
#! Image of <(1)>:
#! A vector space object over GF(3) of dimension 6
#!
#! Image of <(2)>:
#! A vector space object over GF(3) of dimension 5
#!
#! Image of (1)-[{ Z(3)^0*(a) }]->(1):
#! . . . 1 . .
#! 1 . . . . .
#! . 1 . . . .
#! . . 1 . . .
#! . . . . 1 .
#! . . . . . 1
#!
#! A morphism in Category of matrices over GF(3)
#!
#!
#! Image of (1)-[{ Z(3)^0*(b) }]->(2):
#! . 1 . 1 .
#! 1 . 1 . .
#! . 1 . 1 .
#! 1 . 1 . .
#! 1 1 1 1 .
#! 1 1 1 1 1
#!
#! A morphism in Category of matrices over GF(3)
#!
#!
#! Image of (2)-[{ Z(3)^0*(c) }]->(2):
#! . . . 1 .
#! 1 . . . .
#! . 1 . . .
#! . . 1 . .
#! . . . . 1
#!
#! A morphism in Category of matrices over GF(3)
#! 
#! An object in FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ) given by the above data
gammas := WeakDirectSumDecomposition( eleven );
#! [ <(1)->1x6, (2)->0x5>, <(1)->1x6, (2)->1x5>, <(1)->1x6, (2)->1x5>,
#!   <(1)->0x6, (2)->2x5>, <(1)->2x6, (2)->0x5>, <(1)->1x6, (2)->1x5> ]
#! @EndExample

#! As opposed to nine in the previous example, eleven itself
#! can already be decomposed.

#! @Example
Display( Source( UniversalMorphismFromDirectSum( gammas ) ) );
#! Image of <(1)>:
#! A vector space object over GF(3) of dimension 6
#!
#! Image of <(2)>:
#! A vector space object over GF(3) of dimension 5
#!
#! Image of (1)-[{ Z(3)^0*(a) }]->(1):
#!  1 . . . . .
#!  . 2 . . . .
#!  . . 1 . . .
#!  . . . . 2 .
#!  . . . 1 . .
#!  . . . . . 1
#!
#! A morphism in Category of matrices over GF(3)
#!
#!
#! Image of (1)-[{ Z(3)^0*(b) }]->(2):
#!  . . . . .
#!  1 . . . .
#!  . 2 . . .
#!  . . . . .
#!  . . . . .
#!  . . . . 1
#!
#! A morphism in Category of matrices over GF(3)
#!
#!
#! Image of (2)-[{ Z(3)^0*(c) }]->(2):
#!  2 . . . .
#!  . 1 . . .
#!  . . . 2 .
#!  . . 1 . .
#!  . . . . 1
#!
#! A morphism in Category of matrices over GF(3)
#!
#! An object in FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ) given by the above data
#! @EndExample
#! @EndChunk
