load('sonar.mat');
[w, b, output] = svm_train(sonar_Tr, sonar_Tr_Lb, sonar_para_C);
acc_train = svm_predict(sonar_Tr_Lb, sonar_Tr, w, b);
acc_test = svm_predict(sonar_Ts_Lb, sonar_Ts, w, b);
fprintf('w£º\n');
disp(w');
fprintf('b:\n');
disp(b);
fprintf('number of iterations£º %d\n', output.iterations);

fprintf('train accuracy£º%f\n',acc_train);
fprintf('test accuracy£º%f\n',acc_test);