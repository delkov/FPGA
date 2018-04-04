clear all;

c=0:10:60;

 jet_black=[
        0.5000         0         0
        0.5625         0         0
        0.6250         0         0
        0.6875         0         0
        0.7500         0         0
        0.8125         0         0
        0.8750         0         0
        0.9375         0         0
        1.0000         0         0
        1.0000    0.0625         0
        1.0000    0.1250         0
        1.0000    0.1875         0
        1.0000    0.2500         0
        1.0000    0.3125         0
        1.0000    0.3750         0
        1.0000    0.4375         0
        1.0000    0.5000         0
        1.0000    0.5625         0
        1.0000    0.6250         0
        1.0000    0.6875         0
        1.0000    0.7500         0
        1.0000    0.8125         0
        1.0000    0.8750         0
        1.0000    0.9375         0
        1.0000    1.0000         0
        0.9375    1.0000    0.0625
        0.8750    1.0000    0.1250
        0.8125    1.0000    0.1875
        0.7500    1.0000    0.2500
        0.6875    1.0000    0.3125
        0.6250    1.0000    0.3750
        0.5625    1.0000    0.4375
        0.5000    1.0000    0.5000
        0.4375    1.0000    0.5625
        0.3750    1.0000    0.6250
        0.3125    1.0000    0.6875
        0.2500    1.0000    0.7500
        0.1875    1.0000    0.8125
        0.1250    1.0000    0.8750
        0.0625    1.0000    0.9375
             0    1.0000    1.0000
             0    0.9167    1.0000
             0    0.8333    1.0000
             0    0.7500    1.0000
             0    0.6667    1.0000
             0    0.5833    1.0000
             0    0.5000    1.0000
             0    0.4167    1.0000
             0    0.3333    1.0000
             0    0.2500    1.0000
             0    0.1667    1.0000
             0    0.0833    1.0000
             0         0    1.0000
             0         0    0.9091
             0         0    0.8182
             0         0    0.7273
             0         0    0.6364
             0         0    0.5455
             0         0    0.4545
             0         0    0.3636
             0         0    0.2727
             0         0    0.1818
             0         0    0.0909
             0         0         0
    ];

cmap_name=jet_black; % mine, parula_black, jet_black, jet_black_end, jet_white, hot
colormap(gca, cmap_name);



caxis(log([c(1) c(length(c))]));
colorbar('FontSize',11,'YTick',log(c),'YTickLabel',c);
