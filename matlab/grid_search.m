%Driver program for Grid Search
count = 0
for threshold = 0.01:0.02:0.1
   for k = 1.5:0.1:1.8
      for start_sigma = 0.5
          for num_scales = 8
              count = count +1;
sprintf('threshold = %.2f, k = %d, start sigma = %.2f, #Scales = %d', ...
        threshold,k, start_sigma, num_scales)
                BlobDetector2('../data/butterfly.jpg',start_sigma,k,num_scales,threshold);
          end
      end
       
   end
end