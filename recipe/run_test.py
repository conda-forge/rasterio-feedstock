import numpy
import rasterio
import rasterio.env
from rasterio.features import rasterize
from rasterio.transform import IDENTITY

rows = cols = 10
geometry = {'type': 'Polygon',
            'coordinates': [[(2, 2), (2, 4.25), (4.25, 4.25),
                             (4.25, 2), (2, 2)]]}

with rasterio.Env():
    result = rasterize([geometry], out_shape=(rows, cols))
    with rasterio.open(
            'test.tif', 'w',
            driver='GTiff',
            width=cols,
            height=rows,
            count=1,
            dtype=numpy.uint8,
            nodata=0,
            transform=IDENTITY,
            crs={'init': 'EPSG:4326'}) as out:
        out.write_band(1, result.astype(numpy.uint8))
