function [ convuluted ] = conv_n_times(vec , n)
%CONV_N_TIMES convulutes a vector with itself n times without loops 
    
    padded = padarray(vec,[0,max(n)*2]);
    if ~mod(n,2)
      padded(end+1)=0;  
    end
    H = 1:n;
    fft_vec = fft(padded);
    prod = arrayfun(@(x) fft_vec.^x ,n, 'UniformOutput', false);
    padded_ans = arrayfun(@(x) ifft(prod(x,:)) , H);
    convuluted = padded_ans ;%(find(uint8(padded_ans),1,'first'):find(uint8(padded_ans),1,'last'));

end

