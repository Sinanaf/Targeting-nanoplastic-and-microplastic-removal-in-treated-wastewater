function [type,h,p]=stat_test(A,B)

v = vartest2(A,B);

if v
    [h,p] = ttest2(A, B,'Vartype','unequal');
    type='Unequal';
else
   [h,p] = ttest2(A,B);
    type='Equal';
end

end