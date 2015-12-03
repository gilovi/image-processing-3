function res = renderPyramid(pyr,levels)
    
    res = streach(pyr{1});
    for i = 2:levels
        
        res(:,end+1:end+size(pyr{i},2)) = padarray(streach(pyr{i}),[size(pyr{1},1)-size(pyr{i},1),0], 'post');
    end
    
    
end

function streached = streach(im)
        streached = (im - min(im(:)))/max(max(im-min(im(:))));
end
    

