function NumberPoints = GetPointCountQuery()

    prompt = {'Enter Number of Corresponding Points You Wish To Define:'};
    dialogTitle = 'Total Points';
    numLines = 1;
    defaultAnswer = {'4'};
    NumberPoints = inputdlg(prompt,dialogTitle,numLines,defaultAnswer);
    
    NumberPoints =  str2num(NumberPoints{1});
end