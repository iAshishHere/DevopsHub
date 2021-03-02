def replace_content_of_any_file(filepath):    
    with open(filepath,"r+") as f1:
        newText = f1.read().replace("#name",'ashish')
        newText = newText.replace("#fruit",'banana')
        print(newText)

        with open(filepath, "r+") as f2:
            f2.truncate(0)
            f2.write(newText)
		

		
replace_content_of_any_file(r'C:\Users\ashish.kumar\Desktop\ashish.txt')