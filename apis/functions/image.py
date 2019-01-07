from PIL import Image
import os

class ImageMutation:

    def check_file_exists(self, file_path):
        exists = os.path.isfile(file_path)
        if exists:
            return True
        return False
    
    def remove_image(self, file_path):
        if self.check_file_exists(file_path):
            os.remove(file_path)

    def resize_image(self, basewidth, img_path):
        img = Image.open(img_path)
        wpercent = (basewidth/float(img.size[0]))
        hsize = int((float(img.size[1])*float(wpercent)))
        resize = img.resize((basewidth,hsize), Image.NEAREST)
        resize.save(img_path)
        return True
