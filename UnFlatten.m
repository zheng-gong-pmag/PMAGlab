function [Inc_uc]=UnFlatten(Inc,f)

Inc_uc=atand(tand(Inc)./f);

end