import math

#degrees to radians
def d_to_r(degree):
    return degree * math.pi / 180.

#radians to degrees
def r_to_d(radians):
    return radians / math.pi * 180.

def rotate_point(cx, cz, angle, px, pz):
    s = math.sin(angle)
    c = math.cos(angle)

    px -= cx
    pz -= cz

    xnew = px * c - pz * s
    ynew = px * s + pz * c

    px = xnew + cx
    pz = ynew + cz

    return px, pz

def calculate_rotation(c_r, c_x, c_z, t_x, t_z):
    if c_x == t_x and c_z == t_z:
        return 0

    below = False

    if t_z < c_z:
        below = True


    t_x -= c_x
    t_z -= c_z

    cvx, cvy = rotate_point(0, 0, c_r, 1, 0)

    dot_product = cvx * t_x + cvy * t_z
    mod_of_vec_1 = math.sqrt(cvx * cvx + cvy * cvy) * math.sqrt(t_x * t_x + t_z * t_z)
    angle = math.acos(dot_product / mod_of_vec_1)

    if not below:
        return angle
    else:
        return 2 * math.pi - angle

# print(r_to_d(calculate_rotation(d_to_r(45), 0, 0, -1, -1)))

def calculate_distance(c_x, c_z, t_x, t_z):
    return math.sqrt((c_x - t_x) * (c_x - t_x) + (c_z - t_z) * (c_z - t_z))

def get_range(c_y, )

