Sets

         s1 sources / s11,s12,s13/
         d1 demands /d11,d12,d13/


         s2 sources /s21,s22,s23,s24/
         d2 demands /d21,d22/


         s3 sources /s31,s32,s33,s34/
         d3 demands /d31,d32/;

Parameters


         temps1(s1)
                 /s11 511
                  s12 444
                  s13 388
                 /
         tempd1(d1)
                 /d11 488
                  d12 456
                  d13 411
                  /
         fs1(s1)
                 /s11 15.248
                  s12 2
                  s13 15.104
                  /
         fd1(d1)
                 /d11 9.144
                  d12 12.66
                  d13 10.548
                  /





         temps2(s2)
                 /s21 567
                  s22 510
                  s23 478
                  s24 353
                 /
         tempd2(d2)
                 /d21 588
                  d22 390
                  /
         fs2(s2)
                 /s21 1.15
                  s22 3.073
                  s23 10.548
                  s24 13
                  /
         fd2(d2)
                 /d21 7.296
                  d22 11.86
                  /






         temps3(s3)
                 /s31 530
                  s32 410
                  s33 380
                  s34 360
                 /
         tempd3(d3)
                 /d31 552
                  d32 450
                  /
         fs3(s3)
                 /s31 14
                  s32 1.374
                  s33 2.219
                  s34 8
                  /
         fd3(d3)
                 /d31 8
                  d32 15
                  /




Variable

         f11(s1,d1)
         f12(s1,d2)
         f13(s1,d3)

         f22(s2,d2)
         f21(s2,d1)
         f23(s2,d3)

         f33(s3,d3)
         f31(s3,d1)
         f32(s3,d2)


         hu1(d1)
         cu1(d1)

         hu2(d2)
         cu2(d2)

         hu3(d3)
         cu3(d3)

         z;

         nonnegative variable f11,f12,f13,f22,f21,f23,f33,f31,f32,hu1,cu1,hu2,cu2,hu3,cu3;

Equations
one(d1),two(d2),three(d3),four(s1),five(s2),six(s3),seven(d1),eight(d2),nine(d3),hotUtility,work;

*demand satisfaction
one(d1)..      sum[s1 ,f11(s1 ,d1)]+sum[s2 ,f21(s2 ,d1)]+sum[s3 ,f31(s3, d1)] =e= fd1(d1)  ;
two(d2)..      sum[s1 ,f12(s1 ,d2)]+sum[s2 ,f22(s2 ,d2)]+sum[s3 ,f32(s3, d2)] =e= fd2(d2)  ;
three(d3)..    sum[s1 ,f13(s1, d3)]+sum[s2 ,f23(s2, d3)]+sum[s3 ,f33(s3, d3)] =e= fd3(d3)  ;
*source limitation
four(s1)..     sum[d1 ,f11(s1 ,d1)]+sum[d2 ,f12(s1 ,d2)]+sum[d3 ,f13(s1, d3)] =l= fs1(s1)  ;
five(s2)..     sum[d1 ,f21(s2 ,d1)]+sum[d2 ,f22(s2 ,d2)]+sum[d3 ,f23(s2, d3)] =l= fs2(s2)  ;
six(s3)..      sum[d1 ,f31(s3 ,d1)]+sum[d2 ,f32(s3 ,d2)]+sum[d3 ,f33(s3, d3)] =l= fs3(s3)  ;
*heat capacity satisfaction for demands
seven(d1)..    sum[s1 ,f11(s1 ,d1)*temps1(s1)]+sum[s2 ,f21(s2 ,d1)*temps2(s2)]+sum[s3 ,f31(s3 ,d1)*temps3(s3)]+hu1(d1)-cu1(d1) =e= fd1(d1)*tempd1(d1);
eight(d2)..    sum[s1 ,f12(s1 ,d2)*temps1(s1)]+sum[s2 ,f22(s2 ,d2)*temps2(s2)]+sum[s3 ,f32(s3 ,d2)*temps3(s3)]+hu2(d2)-cu2(d2) =e= fd2(d2)*tempd2(d2);
nine(d3)..     sum[s1 ,f13(s1 ,d3)*temps1(s1)]+sum[s2 ,f23(s2 ,d3)*temps2(s2)]+sum[s3 ,f33(s3 ,d3)*temps3(s3)]+hu3(d3)-cu3(d3) =e= fd3(d3)*tempd3(d3);

*objective..    z =e=  sum[d2,hu2(d2)]+sum[d2,cu2(d2)];

*objective..     z =e=  sum[d1, hu1(d1)]+sum[d2, hu2(d2)]+sum[d3, hu3(d3)]+sum[d1,cu1(d1)]+sum[d2,cu2(d2)]+sum[d3,cu3(d3)];
hotUtility..      sum[d1, hu1(d1)]+sum[d2, hu2(d2)]+sum[d3, hu3(d3)]+sum[d1,cu1(d1)]+sum[d2,cu2(d2)]+sum[d3,cu3(d3)] =e= 559.538;

*coldUtility..     sum[d1,cu1(d1)]+sum[d2,cu2(d2)] =e= 93.867;

*objective.. z=e=sum[(s2,d1) ,f21(s2 ,d1)]+sum[(s3,d1) ,f31(s3 ,d1)]+sum[(s3,d2) ,f32(s3 ,d2)];
work..    z =e=  sum[(s2,d1) ,f21(s2 ,d1)]*11.181+sum[(s3,d1) ,f31(s3 ,d1)]*81.4141+sum[(s3,d2) ,f32(s3 ,d2)]*70.2331;
*objective..    z=e=2;
*work..     z =e= sum[(s1,d2) ,f12(s1 ,d2)]*17.64528927;



Model practice /all/;
Solve practice using lp minimizing z;
Display z.l, hu1.l, cu1.l,hu2.l,cu2.l,hu3.l,cu3.l, f11.l,f12.l,f13.l,f22.l,f21.l,f23.l,f33.l,f31.l,f32.l;







