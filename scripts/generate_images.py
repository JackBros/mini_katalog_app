from PIL import Image, ImageDraw, ImageFont
import os

os.makedirs('d:/VSProjects/mini_katalog_app/assets/images', exist_ok=True)

products = [
    ('speaker.png', 'Hoparlör', '#f8bbd0'),
    ('headphones.png', 'Kulaklık', '#ce93d8'),
    ('homepod.png', 'HomePod Mini', '#9fa8da'),
    ('watch.png', 'Akıllı Saat', '#90caf9'),
    ('banner.png', 'Mini Katalog', '#5c6bc0'),
]

font_path = None
try:
    import matplotlib.font_manager as fm
    font_path = fm.findfont('DejaVu Sans')
except Exception:
    font_path = None

for filename, label, color in products:
    size = (800, 800) if filename != 'banner.png' else (1200, 500)
    image = Image.new('RGB', size, color)
    draw = ImageDraw.Draw(image)
    font_size = 140 if filename != 'banner.png' else 64
    if font_path:
        font = ImageFont.truetype(font_path, font_size)
    else:
        font = ImageFont.load_default()
    text = label if filename == 'banner.png' else label[0]
    try:
        bbox = draw.textbbox((0, 0), text, font=font)
        text_width = bbox[2] - bbox[0]
        text_height = bbox[3] - bbox[1]
    except AttributeError:
        text_width, text_height = font.getsize(text)
    position = ((size[0] - text_width) / 2, (size[1] - text_height) / 2)
    draw.text(position, text, fill='white', font=font)
    image.save(f'd:/VSProjects/mini_katalog_app/assets/images/{filename}')
print('images generated')
