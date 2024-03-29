#! @Chunk CategoryRelations

LoadPackage( "CatReps" );

#! @Example
c3c3c3 := ConcreteCategoryForCAP(
                  [ [2,3,1], [4,5,6], [,,,5,6,4],
                    [,,,7,8,9], [,,,,,,8,9,7], [7,8,9] ] );
#! A finite concrete category
objects := SetOfObjects( c3c3c3 );
#! [ An object in subcategory given by: <An object in FinSets>,
#!   An object in subcategory given by: <An object in FinSets>,
#!   An object in subcategory given by: <An object in FinSets> ]
gmorphisms := SetOfGeneratingMorphisms( c3c3c3 );
#! [ A morphism in subcategory given by: <A morphism in FinSets>,
#!   A morphism in subcategory given by: <A morphism in FinSets>,
#!   A morphism in subcategory given by: <A morphism in FinSets>,
#!   A morphism in subcategory given by: <A morphism in FinSets>,
#!   A morphism in subcategory given by: <A morphism in FinSets>,
#!   A morphism in subcategory given by: <A morphism in FinSets> ]
q := RightQuiverFromConcreteCategory( c3c3c3 );
#! q(3)[a:1->1,b:1->2,c:2->2,d:2->3,e:3->3,f:1->3]
relEndo := RelationsOfEndomorphisms( c3c3c3 );
#! [ [ (a*a*a), (1) ], [ (c*c*c), (2) ], [ (e*e*e), (3) ] ]
C := AsFpCategory( c3c3c3 );
#! FreeCategory( RightQuiver(
#!   "q(3)[a:1->1,b:1->2,c:2->2,d:2->3,e:3->3,f:1->3]" ) ) / relations
A := UnderlyingQuiverAlgebra( C );
#! (Q * q) / [ 1*(a*a*a) - 1*(1), 1*(c*c*c) - 1*(2), 1*(e*e*e) - 1*(3),
#! 1*(b*c) - 1*(a*b), 1*(b*d) - 1*(f), 1*(f*e) - 1*(a*f), 1*(d*e) - 1*(c*d) ]
unit := A.1 + A.2 + A.3;
#! { 1*(3) + 1*(2) + 1*(1) }
unit * A.a = A.a;
#! true
A.f * unit = A.f;
#! true
#! @EndExample
