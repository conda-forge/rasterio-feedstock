import numpy
import rasterio
from rasterio.features import rasterize
from rasterio.transform import IDENTITY

# Set GDAL_DATA. This is done normally done by the activate script,
# but this doesn't happen in the testing (_test) environment.
import os
if 'LIBRARY_PREFIX' in os.environ:
    # Windows.
    gdalData = os.path.join(os.environ['LIBRARY_PREFIX'], 'share', 'gdal')
else:
    # Linux/OS X.
    gdalData = os.path.join(os.environ['PREFIX'], 'share', 'gdal')

rows = cols = 10
geometry = {'type': 'Polygon',
            'coordinates': [[(2, 2), (2, 4.25), (4.25, 4.25),
                             (4.25, 2), (2, 2)]]}

with rasterio.drivers():
    result = rasterize([geometry], out_shape=(rows, cols))
    with rasterio.open(
            "test.tif", 'w',
            driver='GTiff',
            width=cols,
            height=rows,
            count=1,
            dtype=numpy.uint8,
            nodata=0,
            transform=IDENTITY,
            crs={'init': "EPSG:4326"}) as out:
        out.write_band(1, result.astype(numpy.uint8))
