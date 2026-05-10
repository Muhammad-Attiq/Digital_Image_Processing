f = [16 2 3 13; 5 11 10 8; 9 7 6 12; 4 14 15 1];

[C, S] = wavedec2(f, 1, 'haar');

[C_multi, S_multi] = wavedec2(f, 2, 'haar');

f_reconstructed_single = waverec2(C, S, 'haar');

f_reconstructed_multi = waverec2(C_multi, S_multi, 'haar');

disp(f_reconstructed_single);
disp(f_reconstructed_multi);
