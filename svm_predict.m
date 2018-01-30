function accuracy = svm_predict(label, x, w, b)
    y0 = x * w + b;
    loss = sum(y0 .* label < 0) / size(x, 1);
    accuracy = 1 - loss;
end