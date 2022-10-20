    Sets

         s1 sources / s11,s12,s13,s14/
         d1 demands /d11,d12,d13,d14/


         s2 sources /s21,s22,s23,s24/
         d2 demands /d21,d22,d23,d24/



Parameters


         temps1(s1)
                 /s11 458
                  s12 373
                  s13 358
                  s14 340
                 /
         tempd1(d1)
                 /d11 463
                  d12 433
                  d13 403
                  d14 353
                  /
         fs1(s1)
                 /s11 8
                  s12 18
                  s13 10
                  s14 11
                  /
         fd1(d1)
                 /d11 2
                  d12 8
                  d13 15
                  d14 22
                  /





         temps2(s2)
                 /s21 422
                  s22 418
                  s23 400
                  s24 346
                 /
         tempd2(d2)
                 /d21 450
                  d22 405
                  d23 380
                  d24 365
                  /
         fs2(s2)
                 /s21 20
                  s22 12
                  s23 12.5
                  s24 14.88
                  /
         fd2(d2)
                 /d21 15
                  d22 13.5
                  d23 11
                  d24 17
                  /











Variable

         f11(s1,d1)
         f12(s1,d2)


         f22(s2,d2)
         f21(s2,d1)




         hu1(d1)
         cu1(d1)

         hu2(d2)
         cu2(d2)



         z;

         nonnegative variable f11,f12,f22,f21,hu1,cu1,hu2,cu2;

Equations
one(d1),two(d2),four(s1),five(s2),seven(d1),eight(d2),hotUtility,flow;

*demand satisfaction
one(d1)..      sum[s1 ,f11(s1 ,d1)]+sum[s2 ,f21(s2 ,d1)] =e= fd1(d1)  ;
two(d2)..      sum[s1 ,f12(s1 ,d2)]+sum[s2 ,f22(s2 ,d2)] =e= fd2(d2)  ;

*source limitation
four(s1)..     sum[d1 ,f11(s1 ,d1)]+sum[d2 ,f12(s1 ,d2)] =l= fs1(s1)  ;
five(s2)..     sum[d1 ,f21(s2 ,d1)]+sum[d2 ,f22(s2 ,d2)] =l= fs2(s2)  ;

*heat capacity satisfaction for demands
seven(d1)..    sum[s1 ,f11(s1 ,d1)*temps1(s1)]+sum[s2 ,f21(s2 ,d1)*temps2(s2)]+hu1(d1)-cu1(d1) =e= fd1(d1)*tempd1(d1);
eight(d2)..    sum[s1 ,f12(s1 ,d2)*temps1(s1)]+sum[s2 ,f22(s2 ,d2)*temps2(s2)]+hu2(d2)-cu2(d2) =e= fd2(d2)*tempd2(d2);


*objective..    z =e=  sum[d2,hu2(d2)]+sum[d2,cu2(d2)];

*objective..    z =e=  sum[d1, hu1(d1)]+sum[d2, hu2(d2)]+sum[d1,cu1(d1)]+sum[d2,cu2(d2)];
hotUtility..    sum[d1, hu1(d1)]+sum[d2, hu2(d2)]+sum[d1,cu1(d1)]+sum[d2,cu2(d2)] =e=480.22;

*coldUtility..     sum[d1,cu1(d1)]+sum[d2,cu2(d2)] =e= 93.867;

*objective.. z=e=sum[(s2,d1) ,f21(s2 ,d1)]+sum[(s3,d1) ,f31(s3 ,d1)]+sum[(s3,d2) ,f32(s3 ,d2)];
flow..    z =e=  sum[(s2,d1) ,f21(s2 ,d1)];
*objective..    z=e=2;
*work..     z =e= sum[(s1,d2) ,f12(s1 ,d2)]*17.64528927;



Model practice /all/;
Solve practice using lp minimizing z;
Display z.l, hu1.l, cu1.l,hu2.l,cu2.l, f11.l,f12.l,f22.l,f21.l;








