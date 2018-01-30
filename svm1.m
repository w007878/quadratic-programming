load('australian.mat');
[w, b, output] = svm_train(australian_Tr, australian_Tr_Lb, australian_para_C);
acc_train = svm_predict(australian_Tr_Lb, australian_Tr, w, b);
acc_test = svm_predict(australian_Ts_Lb, australian_Ts, w, b);
fprintf('w£º\n');
disp(w');
fprintf('b:\n');
disp(b);
fprintf('number of iterations£º %d\n', output.iterations);

fprintf('train accuracy£º%f\n',acc_train);
fprintf('test accuracy£º%f\n',acc_test);