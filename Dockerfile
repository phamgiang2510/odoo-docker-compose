FROM odoo:16

USER root

# Copy extra-addons and install requirements
COPY extra-addons /mnt/extra-addons
RUN find /mnt/extra-addons -name "requirements.txt" -exec pip3 install -r {} \;

# Delete extra-addons (mounted from host)
RUN rm -rf /mnt/extra-addons

# Delete odoo source code (mounted from host)
RUN rm -rf /usr/lib/python3/dist-packages/odoo
RUN rm -rf /opt/odoo

USER odoo
