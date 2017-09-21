% store the coordinates info for each macro-element for both 0 and 1 side.
% for this case, 0 side is air, 1 side is liquid
%%%%%%%%%%%%%%%%%%%%%%%
%% passing global nodes info
global pt2971 pt2973 pt3183 pt3225...
       pt3233 pt3234 pt3587 pt3646...
       pt420 pt432 pt540 pt550...
       pt551 pt570 pt719 pt728
run node_info.m
%% preparing the arrays which contains the elem coords info
global coord27_0 coord27_1...
       coord42_0 coord42_1...
       coord52_0 coord52_1...
       coord20_0 coord20_1...
       coord21_0 coord21_1...
       coord51_0 coord51_1...
%
coord27_0 = [pt3234; pt3587; pt3183; pt3225];
coord27_1 = [pt551; pt432; pt570; pt550];
coord42_0 = [pt3234; pt2971; pt3233; pt3225];
coord42_1 = [pt551; pt719; pt540; pt550];
coord52_0 = [pt3234; pt3646; pt3587; pt3225];
coord52_1 = [pt551; pt570; pt728; pt550];
coord20_0 = [pt2973; pt2971; pt3234; pt3225];
coord20_1 = [pt420; pt551; pt540; pt550];
coord21_0 = [pt3183; pt2973; pt3234; pt3225];
coord21_1 = [pt432; pt551; pt420; pt550];
coord51_0 = [pt3233; pt3646; pt3234; pt3225];
coord51_1 = [pt719; pt551; pt728; pt550];

