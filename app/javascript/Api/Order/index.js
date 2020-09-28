import { Api } from '..';

export const getListProduct = () => {
  const path = `/api/v1/product`;
  return Api.get(path);
};

export const searchPartner = (phoneNumber) => {
  const path = `/api/v1/search_partner`;
  return Api.post(path, { phone_number: phoneNumber });
};
