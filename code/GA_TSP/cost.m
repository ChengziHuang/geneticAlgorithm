function [value] = cost(parent, costM)

    [NumP,tmp] = size(parent);

    for i = 1 : NumP
        parent_i = parent(i,:);
        value_i = 0;
        for j=1:12
            value_i = value_i + costM(parent_i(j),parent_i(j+1));
        end
        value_i = value_i + costM(parent_i(13),parent_i(1));

        value(i,1) = value_i;

    end

end