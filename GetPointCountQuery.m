function NumberPoints = GetPointCountQuery()
%%GetPointCountQuery Query for number of user entered points to use for matching
%%% Julian Anthony Brackins   %%%
%%% CSC 514 - Computer Vision %%%
%%% Project 2                 %%%

    prompt = {'Enter Number of Corresponding Points You Wish To Define:'};
    dialogTitle = 'Total Points';
    numLines = 1;
    defaultAnswer = {'4'};
    NumberPoints = inputdlg(prompt,dialogTitle,numLines,defaultAnswer);
    
    
    NumberPoints =  str2num(NumberPoints{1});
end