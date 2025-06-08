if nixCats('nixCats_packageName') == 'stable' then
    require('stableVim.init') 
elseif nixCats('nixCats_packageName') == 'test' then
    require('testVim.init') end 
