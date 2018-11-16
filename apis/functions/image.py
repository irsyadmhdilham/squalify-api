from PIL import Image

def resize_image(img_path, basewidth, rename):
    img = Image.open(img_path)
    wpercent = (basewidth/float(img.size[0]))
    hsize = int((float(img.size[1])*float(wpercent)))
    resize = img.resize((basewidth,hsize), Image.NEAREST)
    resize.save('hello.jpg')
    return True
