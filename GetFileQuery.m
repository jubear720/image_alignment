function [ File1, File2 ] = GetFileQuery( default1, default2 )
%GetFileQuery User input for selecting corresponding images
%%% Julian Anthony Brackins   %%%
%%% CSC 514 - Computer Vision %%%
%%% Project 2                 %%%

    if nargin < 2
       default1 = 'img\Yosemite\Yosemite1.jpg';
       default2 = 'img\Yosemite\Yosemite2.jpg';
    end
    
    prompt = {'Enter Path for First Image:', 'Enter Path for Second Image:'};
    dialogTitle = 'Select Images for Stitching';
    numLines = [1 100];
    defaultAnswer = {default1, default2};
    Answer = inputdlg(prompt,dialogTitle,numLines,defaultAnswer);
    
    
    File1 =  Answer{1};
    File2 =  Answer{2};

end