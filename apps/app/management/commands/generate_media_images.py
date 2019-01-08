import os
from django.core.management.base import BaseCommand
from django.conf import settings
from apps.store import models as store_models
from PIL import Image as Pil_Image


def image_resize(file_path, size, output_folder, filename=None):
    if os.path.isfile(file_path):
        if not os.path.exists(output_folder):
            os.makedirs(output_folder)
        image = Pil_Image.open(file_path)
        if not filename:
            filename = str(image.filename).split("/")[-1]
        image.thumbnail(size, Pil_Image.ANTIALIAS)
        image.save(f"{output_folder}/{filename}", optimize=True)
        return filename


class Command(BaseCommand):
    help = 'Generate images with given size'

    def handle(self, *args, **kwargs):
        file_count = 0
        products = store_models.Product.objects.filter(image__isnull=False)

        def folder_creator(folder_path):
            if not os.path.isdir(folder_path):
                os.mkdir(folder_path)

        folder_creator(settings.PRODUCTS_FOLDER)
        folder_creator(settings.THUMBNAILS_FOLDER)
        folder_creator(settings.MEDIUMS_FOLDER)
        folder_creator(settings.ORIGINALS_FOLDER)

        for product in products:
            filename = product.image.name
            original_image_path = product.image.path
            thumbnail_filename = f"100x100_{filename}"
            medium_filename = f"151x200_{filename}"

            image_resize(original_image_path, (100, 100), settings.THUMBNAILS_FOLDER, thumbnail_filename)
            file_count += 1
            image_resize(original_image_path, (151, 200), settings.MEDIUMS_FOLDER, medium_filename)
            file_count += 1
            for image_instance in product.images.all():
                filename = image_instance.image.name
                original_image_path = image_instance.image.path
                thumbnail_filename = f"100x100_{filename}"
                medium_filename = f"151x200_{filename}"
                image_resize(original_image_path, (100, 100), settings.THUMBNAILS_FOLDER, thumbnail_filename)
                file_count += 1
                image_resize(original_image_path, (151, 200), settings.MEDIUMS_FOLDER, medium_filename)
                file_count += 1

        self.stdout.write(f"{file_count} images generated")
